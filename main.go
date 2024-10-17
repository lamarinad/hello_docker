package main

import (
	"fmt"
	"log/slog"
	"net/http"
)

func main() {
	slog.Info("Сервер запущен")

	http.HandleFunc("/", helloWorld)

	if err := http.ListenAndServe(":8080", nil); err != nil {
		slog.Error("Сервер остановлен: " + err.Error())
	}

	slog.Info("Сервер остановлен")
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	slog.Info("Отклик в консоль: Hello, World!")
	fmt.Fprintln(w, "Hello, World!")
}
