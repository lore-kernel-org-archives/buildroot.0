From: Richard Braun <rbraun@sceen.net>
Date: Mon, 14 Jan 2013 22:54:31 +0100
Subject: [Buildroot] [PATCH] curlftpfs: new package
In-Reply-To: <87sj63phtl.fsf@dell.be.48ers.dk>
References: <1351604119-23101-1-git-send-email-fenixk19@mail.ru>
 <87sj63phtl.fsf@dell.be.48ers.dk>
Message-ID: <20130114215431.GA4345@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 14, 2013 at 10:37:10PM +0100, Peter Korsgaard wrote:
> Committed with minor changes, see below.

Thanks for taking care of it :).

> It's not clear to me what this patch tries to do, the package doesn't
> use it as AUTORECONF isn't set to yes and it builds ok without it here,
> so I've dropped it.

IIRC, it was related to libintl/gettext and libglib2. If it now builds
fine without it, I take it the upstream issue has been cleanly fixed and
the patch is very likely useless now.

-- 
Richard Braun
