From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Nov 2016 19:53:52 +0200
Subject: [Buildroot] [PATCH next 1/4] lttng-tools: bump version to 2.9.0
In-Reply-To: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
References: <20161130170445.55222-1-Vincent.Riera@imgtec.com>
Message-ID: <20161130175352.uqsmg6hb3hmlbgem@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Wed, Nov 30, 2016 at 05:04:42PM +0000, Vicente Olivert Riera wrote:
> Drop sha256 hash. The combination of md5 and sha1 hashes is enough.

I don't think so. Neither md5 nor sha1 is considered cryptographically secure. 
Their combination is probably better than either alone. But sha256 is even 
better. Not only because of its larger hash value, but also because the 
algorithm itself. Why drop it?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
