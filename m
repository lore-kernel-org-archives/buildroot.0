From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 07:47:52 -0300
Subject: [Buildroot] [PATCH] gettext: don't build tools if they won't be
 installed
In-Reply-To: <1348180978-20654-1-git-send-email-arnout@mind.be>
References: <1348180978-20654-1-git-send-email-arnout@mind.be>
Message-ID: <505C45D8.8010705@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/20/12 19:42, Arnout Vandecappelle (Essensium/Mind) wrote:

> When only libintl is requested from gettext, it is not necessary to
> build and install the tools in staging.  Just run configure and make
> in the gettext-runtime directory.
> 
> This _will_ install the gettext executable in the target.  But that
> seems the correct thing to do, since it may be used by scripts.

It wasn't installed before and things worked, why would it be needed now?
Regards.
