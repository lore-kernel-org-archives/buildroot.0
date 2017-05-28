From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 27 May 2017 21:45:50 -0300
Subject: [Buildroot] [PATH 1/2] support/testing: rename variables for
 readability
References: <1495922327-16174-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <592a1dbee08ce_416e3fd3b8998434103cf@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, May 27, 2017 at 06:58 PM, Luca Ceresoli wrote:

> The 'lines' variable is overwritten with its own fields. Thus it
> contains a line first, and then a list of fields -- it never contains
> 'lines'.
> 
> Use two different variables named 'line' and 'fields' to make the code
> more readable.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
