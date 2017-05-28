From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:55:29 +0200
Subject: [Buildroot] [PATH 1/2] support/testing: rename variables for
 readability
In-Reply-To: <1495922327-16174-1-git-send-email-luca@lucaceresoli.net>
References: <1495922327-16174-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20170528145529.1ad0610c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 23:58:46 +0200, Luca Ceresoli wrote:
> The 'lines' variable is overwritten with its own fields. Thus it
> contains a line first, and then a list of fields -- it never contains
> 'lines'.
> 
> Use two different variables named 'line' and 'fields' to make the code
> more readable.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  support/testing/tests/fs/test_ext.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Both applied to master. Thanks!

For some reason, your first patch had a broken prefix: [PATH] instead
of [PATCH]. I guess you hand-edited the patch, and made a typo?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
