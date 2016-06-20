From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jun 2016 09:50:34 -0300
Subject: [Buildroot] [PATCH 010/121] package/gstreamer1: add hash file
In-Reply-To: <87y4612d65.fsf@dell.be.48ers.dk>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <4d192a07160d9c41e9abe7e1aaa73a6f7f28c435.1466334225.git.yann.morin.1998@free.fr>
 <87y4612d65.fsf@dell.be.48ers.dk>
Message-ID: <5767E69A.4030606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/06/16 16:26, Peter Korsgaard wrote:

>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>   > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>   > ---
>   >  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
>   >  1 file changed, 2 insertions(+), 2 deletions(-)
>
>   > diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
>   > index b32fcfe..a3a33cb 100644
>   > --- a/package/gstreamer1/gstreamer1/gstreamer1.hash
>   > +++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
>   > @@ -1,2 +1,2 @@
>   > -# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.2.tar.xz.sha256sum
>   > -sha256	9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
>   > +# localy computed
>   > +sha256  9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
>
> Just as for gstreamer, I've appended the sha256 to the file.

Hi.
Why on earth do we need duplicate hashes (upstream + locally computed 
which are based on the same algo)?
And what's the reason massive hashes are suddenly required? I've seen 
the autobuilders getting corrupted downloads, but why is it happening?
Regards.
