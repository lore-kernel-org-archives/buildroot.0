From: a <anushka.parashar@tesco.com>
Date: Thu, 28 Nov 2019 23:01:19 -0600 (CST)
Subject: [Buildroot] Logs on console
In-Reply-To: <20191128225535.42941a34@gmx.net>
References: <1574658915896-0.post@n4.nabble.com>
 <20191128225535.42941a34@gmx.net>
Message-ID: <1575003679918-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I want everything to go in a file, I have an executable which runs my
application, I just want that to get printed when the system starts. I have
added it to inittab file already to run on startup.

<http://buildroot-busybox.2317881.n4.nabble.com/file/t2815/Screenshot_2019-11-29_at_10.png> 
Screenshot_2019-11-29_at_10.png
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2815/Screenshot_2019-11-29_at_10.png>  

Every time when I run some commands on console messages like - random:fast
init done, random: crng init done and some updates from network interfaces
also appear telling which link went up or down.These updates are the most
annoying ones, they definitely don't look good along with the output of my
execitable.

Please tell me how to suppress those and where in buildroot directory do we
add those commands(to suppress them or to add them to any other file) so
that they don't appear on the console.




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
