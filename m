From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Nov 2013 16:07:41 +0100
Subject: [Buildroot] [PATCH 0/7] RFC: Move to github as source for
 ARC-specific packages
In-Reply-To: <CAEBucnCw-KQ9bgZazwgs9PkV9MvRHsQ4Wh8LicJrF48Xo4p89A@mail.gmail.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
 <CAEBucnCw-KQ9bgZazwgs9PkV9MvRHsQ4Wh8LicJrF48Xo4p89A@mail.gmail.com>
Message-ID: <CAAXf6LUarUkDU9SyHc-rHwx5uKmWAQq4DyZkZc4mhv_aFxdXqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 12, 2013 at 3:59 PM, Spenser Gilliland
<spenser@gillilanding.com> wrote:
>
> Just a quick comment.  When downloading from github do not use the git://
> protocol use http:// as shown in section 6.2.8 of the buildroot manual.
>

True.
We recently also talked about creating a utility function that wraps
all github URLs, and use https iso http.
See http://lists.busybox.net/pipermail/buildroot/2013-November/081714.html
and http://lists.busybox.net/pipermail/buildroot/2013-November/081823.html

If anyone is interested in implementing this, please do.

Best regards,
Thomas
