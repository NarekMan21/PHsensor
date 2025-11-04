# Настройка туннеля для доступа к ESP8266 через HTTPS

Если вы хотите подключиться к ESP8266 с GitHub Pages, нужно создать HTTPS туннель к вашему локальному устройству.

## Вариант 1: ngrok (самый простой)

### Установка:
1. Скачайте ngrok: https://ngrok.com/download
2. Распакуйте и добавьте в PATH

### Использование:
```bash
ngrok http 192.168.1.22:80
```

### Результат:
Вы получите HTTPS URL вида: `https://xxxx-xx-xx-xx-xx.ngrok-free.app`

### В веб-приложении:
Введите полученный HTTPS URL вместо IP адреса ESP8266.

---

## Вариант 2: Cloudflare Tunnel (бесплатный, постоянный)

### Установка:
```bash
# Windows
# Скачайте cloudflared.exe с https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation/

# Или через Chocolatey
choco install cloudflared

# Или через Scoop
scoop install cloudflared
```

### Использование:
```bash
cloudflared tunnel --url http://192.168.1.22:80
```

### Результат:
Вы получите HTTPS URL вида: `https://xxxx-xxxx.trycloudflare.com`

---

## Вариант 3: localtunnel (Node.js)

### Установка:
```bash
npm install -g localtunnel
```

### Использование:
```bash
lt --port 80 --local-host 192.168.1.22
```

### Результат:
Вы получите HTTPS URL вида: `https://xxxx.loca.lt`

---

## Вариант 4: serveo (без установки)

### Использование:
```bash
ssh -R 80:192.168.1.22:80 serveo.net
```

### Результат:
Вы получите HTTPS URL

---

## Рекомендация

**Для постоянного использования:**
- Cloudflare Tunnel (бесплатный, постоянный URL)

**Для быстрого тестирования:**
- ngrok (самый простой)

**Для разработки:**
- Откройте ESP8266 напрямую по IP адресу (самый простой способ)

---

## Важно

После создания туннеля:
1. Скопируйте полученный HTTPS URL
2. В веб-приложении введите этот URL вместо IP адреса
3. Нажмите "Подключиться"

Приложение автоматически определит, что это HTTPS URL и будет использовать прямые запросы без прокси.

