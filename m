From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 10:52:40 +0100
Subject: [Buildroot] [PATCH v3] bind: fix intermittent build issues with
 high BR2_JLEVEL
In-Reply-To: <1454749207-23363-1-git-send-email-heyleke@gmail.com>
References: <1454749207-23363-1-git-send-email-heyleke@gmail.com>
Message-ID: <20160206105240.7a7694a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Heylen,

On Sat,  6 Feb 2016 10:00:07 +0100, Jan Heylen wrote:
> Build sometimes breaks with:
> 
> libtool: link: `unix/os.lo' is not a valid libtool object
> make[3]: *** [rndc-confgen] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory `/scratch/peko/build/bind-9.6-ESV-R4/bin/rndc/unix'
> 
> So disable parallel builds.
> 
> [Jan Heylen: This patch was removed with commit c36b5d89c5616f7ca0a7295cbb5c231606beb71e
> by Gustavo Zacarias <gustavo@zacarias.com.ar> but the problem still occurs,
> so disabling parallel builds again]

When a patch is your own patch, there is no need to put such comments
between [<your name>: ...]. It's only when you take over the patch of
someone else. So I've kept this comment in the commit log, without the
[<your name>: ...] around it.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
