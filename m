From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 11 Jan 2019 00:53:25 -0200
Subject: [Buildroot] [PATCH] checkpackagelib: fix Python3 execution
References: <20190110205539.10468-1-patrickdepinguin@gmail.com>
Message-ID: <5c38052556fc4_7b6b3f9bfc12550c7150@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Jan 10, 2019 at 06:55 PM, Thomas De Schampheleire wrote:

> The relative imports do not work in Python 3. Adding the leading dot works
> both in Python2 and Python3.
> 
> This may cause problems if ever you would try to call the helper .py files
> directly, but this is not currently needed/supported.

Could you review this one instead?
http://patchwork.ozlabs.org/patch/956517/


Regards,
Ricardo
