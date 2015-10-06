From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 6 Oct 2015 07:18:12 -0300
Subject: [Buildroot] [PATCH] glib-networking: specify GIO_MODULE_DIR for
	target
In-Reply-To: <878u7gfhrx.fsf@dell.be.48ers.dk>
References: <1444074870-31815-1-git-send-email-gustavo@zacarias.com.ar>
 <878u7gfhrx.fsf@dell.be.48ers.dk>
Message-ID: <56139FE4.8040802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/15 06:49, Peter Korsgaard wrote:

> Committed, thanks.
>
> Lets hope we won't have too much other fallout from the bump.

Hi.
The other glib/gio module-installing package (gvfs) computes the gio 
install directory based on it's own destdir, so at least that one is 
safe from the abuse.
Regards.
