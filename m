From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Oct 2014 22:01:29 +0300
Subject: [Buildroot] [PATCH] openssh: bump to version 6.7p1
In-Reply-To: <5433E0B2.1030901@zacarias.com.ar>
References: <1412680305-28778-1-git-send-email-gustavo@zacarias.com.ar>
 <20141007123927.GD8276@tarshish> <5433E0B2.1030901@zacarias.com.ar>
Message-ID: <20141007190129.GG8276@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Oct 07, 2014 at 09:46:42AM -0300, Gustavo Zacarias wrote:
> On 10/07/2014 09:39 AM, Baruch Siach wrote:
> > Why not use the (base64 encoded) hash values from 
> > http://www.openssh.com/txt/release-6.7? The output of
> > 
> > 	echo svg5Tq6Fjau9732sELma7ADJVGJ1PoA0LlMLu29yVQc= |base64 -d |hd
> > 
> > matches your calculated SHA256 AFAICS.
> 
> Because i've found out about the release from another source.
> Both are equally good though.

I think this link is worth mentioning in the .hash file. It allows the user to 
verify the hash against an external source, adding to the warm and fuzzy 
feeling that is the whole point of .hash files. This is especially important 
for sensitive packages like OpenSSH.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
