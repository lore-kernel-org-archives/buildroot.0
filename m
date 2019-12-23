From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:17:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libffi: fix build failure on
 power7 and older
In-Reply-To: <CAPi7W82ANuDdNBnSQPw5TT=HDRFP76fqadrk9nTBBfwnpRCxew@mail.gmail.com>
References: <20191223213610.142006-1-fontaine.fabrice@gmail.com>
 <20191223224442.6c62aafa@windsurf>
 <CAPi7W82ANuDdNBnSQPw5TT=HDRFP76fqadrk9nTBBfwnpRCxew@mail.gmail.com>
Message-ID: <20191223231710.2a89a960@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Dec 2019 22:49:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > I just applied your previous patch tonight, so I guess this one needs
> > to replace the previous one, no ?  
> Nope, both patches are needed.
> The previous one for _Float128 (not sent yet upstream) and this one
> for __int128 (from upstream).

OK, thanks for the clarification. This float128/int128 stuff is quite
confusing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
