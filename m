From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 25 Sep 2019 10:33:14 -0700
Subject: [Buildroot] Failure upgrading 8/2017 to 8/2019
In-Reply-To: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
References: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
Message-ID: <CAJJ6jxu33wpoDmFU+F-ny-Ak8dMT3o9Z199yskk_dN5+67CdWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am also getting lots of python build errors?

PYTHONPATH="/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/lib/python2.7/sysconfigdata/"
cd /home/calfee/nobu/br/dockstar/ds_9_2019/output/target &&
/home/calfee/nobu/br/dockstar/ds_9_2019/output/host/bin/python2.7
/home/calfee/nobu/br/dockstar/ds_9_2019/support/scripts/pycompile.py
usr/lib/python2.7
Compiling usr/lib/python2.7/site-packages/tornado/auth.py ...
  File "usr/lib/python2.7/site-packages/tornado/auth.py", line 90
    callback_uri: str = None,
                ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/autoreload.py ...
  File "usr/lib/python2.7/site-packages/tornado/autoreload.py", line 118
    def start(check_time: int = 500) -> None:
                        ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/concurrent.py ...
  File "usr/lib/python2.7/site-packages/tornado/concurrent.py", line 52
    def is_future(x: Any) -> bool:
                   ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/curl_httpclient.py ...
  File "usr/lib/python2.7/site-packages/tornado/curl_httpclient.py", line 50
    self, max_clients: int = 10, defaults: Dict[str, Any] = None
                     ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/escape.py ...
  File "usr/lib/python2.7/site-packages/tornado/escape.py", line 43
    def xhtml_escape(value: Union[str, bytes]) -> str:
                          ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/gen.py ...
  File "usr/lib/python2.7/site-packages/tornado/gen.py", line 126
    def _value_from_stopiteration(e: Union[StopIteration, "Return"]) -> Any:
                                   ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/http1connection.py ...
  File "usr/lib/python2.7/site-packages/tornado/http1connection.py", line 43
    def __init__(self) -> None:
                       ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/httpclient.py ...
  File "usr/lib/python2.7/site-packages/tornado/httpclient.py", line 90
    self, async_client_class: Type["AsyncHTTPClient"] = None, **kwargs: Any
                            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/httpserver.py ...
  File "usr/lib/python2.7/site-packages/tornado/httpserver.py", line 144
    def __init__(self, *args: Any, **kwargs: Any) -> None:
                            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/httputil.py ...
  File "usr/lib/python2.7/site-packages/tornado/httputil.py", line 82
    def __init__(self, size: int) -> None:
                           ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/ioloop.py ...
  File "usr/lib/python2.7/site-packages/tornado/ioloop.py", line 67
    def fileno(self) -> int:
                     ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/iostream.py ...
  File "usr/lib/python2.7/site-packages/tornado/iostream.py", line 117
    def __init__(self, real_error: BaseException = None) -> None:
                                 ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/locale.py ...
  File "usr/lib/python2.7/site-packages/tornado/locale.py", line 63
    def get(*locale_codes: str) -> "Locale":
                         ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/locks.py ...
  File "usr/lib/python2.7/site-packages/tornado/locks.py", line 42
    def __init__(self) -> None:
                       ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/log.py ...
  File "usr/lib/python2.7/site-packages/tornado/log.py", line 55
    def _stderr_supports_color() -> bool:
                                 ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/netutil.py ...
  File "usr/lib/python2.7/site-packages/tornado/netutil.py", line 69
    port: int,
        ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/options.py ...
  File "usr/lib/python2.7/site-packages/tornado/options.py", line 127
    def __init__(self) -> None:
                       ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/platform/asyncio.py ...
  File "usr/lib/python2.7/site-packages/tornado/platform/asyncio.py", line 42
    self, asyncio_loop: asyncio.AbstractEventLoop, **kwargs: Any
                      ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/platform/caresresolver.py ...
  File "usr/lib/python2.7/site-packages/tornado/platform/caresresolver.py",
line 31
    def initialize(self) -> None:
                         ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/platform/interface.py ...
  File "usr/lib/python2.7/site-packages/tornado/platform/interface.py", line 24
    def set_close_exec(fd: int) -> None:
                         ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/platform/posix.py ...
  File "usr/lib/python2.7/site-packages/tornado/platform/posix.py", line 22
    def set_close_exec(fd: int) -> None:
                         ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/platform/twisted.py ...
  File "usr/lib/python2.7/site-packages/tornado/platform/twisted.py", line 66
    def initialize(self) -> None:
                         ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/platform/windows.py ...
  File "usr/lib/python2.7/site-packages/tornado/platform/windows.py", line 19
    def set_close_exec(fd: int) -> None:
                         ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/process.py ...
  File "usr/lib/python2.7/site-packages/tornado/process.py", line 51
    def cpu_count() -> int:
                    ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/queues.py ...
  File "usr/lib/python2.7/site-packages/tornado/queues.py", line 60
    future: Future, timeout: Union[None, float, datetime.timedelta]
          ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/routing.py ...
  File "usr/lib/python2.7/site-packages/tornado/routing.py", line 194
    self, request: httputil.HTTPServerRequest, **kwargs: Any
                 ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/simple_httpclient.py ...
  File "usr/lib/python2.7/site-packages/tornado/simple_httpclient.py", line 53
    def __init__(self, message: str) -> None:
                              ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/tcpclient.py ...
  File "usr/lib/python2.7/site-packages/tornado/tcpclient.py", line 62
    addrinfo: List[Tuple],
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/tcpserver.py ...
  File "usr/lib/python2.7/site-packages/tornado/tcpserver.py", line 110
    ssl_options: Union[Dict[str, Any], ssl.SSLContext] = None,
               ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/template.py ...
  File "usr/lib/python2.7/site-packages/tornado/template.py", line 226
    def filter_whitespace(mode: str, text: str) -> str:
                              ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/asyncio_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/asyncio_test.py", line 58
    x = yield from event_loop.run_in_executor(None, lambda: 42)
                 ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/concurrent_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/concurrent_test.py",
line 200
    async def f():
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/gen_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/gen_test.py", line 383
    async def f2():
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/httpserver_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/httpserver_test.py",
line 52
    async def read_stream_body(stream):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/httputil_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/httputil_test.py", line 29
    def form_data_args() -> Tuple[Dict[str, List[bytes]], Dict[str,
List[HTTPFile]]]:
                         ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/ioloop_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/ioloop_test.py", line 350
    async def callback():
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/locks_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/locks_test.py", line 359
    async def f():
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/queues_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/queues_test.py", line 166
    async def f():
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/simple_httpclient_test.py
...
  File "usr/lib/python2.7/site-packages/tornado/test/simple_httpclient_test.py",
line 184
    async def make_client():
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/tcpserver_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/tcpserver_test.py", line 50
    async def handle_stream(self, stream, address):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/testing_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/testing_test.py", line 73
    async def callback():
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/util_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/util_test.py", line 228
    print("hello", file=f)
                       ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/web_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/web_test.py", line 2447
    async def data_received(self, data):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/test/websocket_test.py ...
  File "usr/lib/python2.7/site-packages/tornado/test/websocket_test.py",
line 196
    async def open(self):
            ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/testing.py ...
  File "usr/lib/python2.7/site-packages/tornado/testing.py", line 52
    def bind_unused_port(reuse_port: bool = False) -> Tuple[socket.socket, int]:
                                   ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/util.py ...
  File "usr/lib/python2.7/site-packages/tornado/util.py", line 53
    def _get_emulated_is_finalizing() -> Callable[[], bool]:
                                      ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/web.py ...
  File "usr/lib/python2.7/site-packages/tornado/web.py", line 205
    application: "Application",
               ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/websocket.py ...
  File "usr/lib/python2.7/site-packages/tornado/websocket.py", line 63
    def compress(self, data: bytes) -> bytes:
                           ^
SyntaxError: invalid syntax

Compiling usr/lib/python2.7/site-packages/tornado/wsgi.py ...
  File "usr/lib/python2.7/site-packages/tornado/wsgi.py", line 51
    def to_wsgi_str(s: bytes) -> str:
                     ^
SyntaxError: invalid syntax
