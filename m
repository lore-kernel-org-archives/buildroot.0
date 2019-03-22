From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 22 Mar 2019 10:29:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-20
In-Reply-To: <20190321070043.3390386D73@whitealder.osuosl.org>
References: <20190321070043.3390386D73@whitealder.osuosl.org>
Message-ID: <20190322102919.GC13496@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Mar 2019 07:00:38 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> [...]
>
>          arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/77571d7ea2914638e30f017e8a4965eb89960802 |     
>          arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/2520e6d94a82669b5d8e1aabeb10884fd43f1912 |     

These two are the same. It looks like some issue related to some header
not being #include'd. I'll take a stab at solving this, along with the
other build failures for this package which have been accumulating in the
last couple of weeks.

Cheers,

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190322/1981ab07/attachment.asc>
