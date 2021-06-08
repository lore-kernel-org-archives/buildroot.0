From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 8 Jun 2021 10:44:38 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: allow building with
 musl and uclibc
In-Reply-To: <20210604211549.GJ168928@scaer>
References: <20210526182416.2798443-1-aperez@igalia.com>
 <20210604211549.GJ168928@scaer>
Message-ID: <20210608104438.GB727453@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 04 Jun 2021 23:15:49 +0200 "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
 
> On 2021-05-26 21:24 +0300, Adrian Perez de Castro spake thusly:
> > WebKitGTK 2.32.1 includes fixes for building with the Musl libc, which
> > also makes it possible to use uClibc as well, therefore arrange
> > dependencies to allow selecting the package any of the C libraries is in
> > use. This is done by making the dependencies be more granular, basically
> > following what the wpewebkit package does.
> > 
> > In order to make make it build against uClibc a small patch that has
> > been submitted to the upstream's Bugzilla is needed.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Applied to next, thanks.
> 
> Same tweaks as for the wpewebkit patch.

Wonderful, thanks! \o/
 
-Adrian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210608/9ebb50f4/attachment.asc>
