From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 05 May 2010 20:52:31 +0300
Subject: [Buildroot] finding package dependencies
In-Reply-To: <4BE1AE7A.8000107@carallon.com>
References: <4BE1AE7A.8000107@carallon.com>
Message-ID: <4BE1B05F.3070002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/2010 08:44 PM, Will Wagner wrote:
> Hello,
>
> Is there some way of finding out a packages dependencies by running a
> make target? Would like to know what a packages dependencies were
> without having to just try building it.

One way I think is to grep make output for -l GCC flag...
