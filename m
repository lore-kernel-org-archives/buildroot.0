From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 13:56:20 +0200
Subject: [Buildroot] [PATCH] package/joe: license is GPL-2.0+
In-Reply-To: <CAGm1_kvyftWG87WG-Vn4whgi2jw=amS0PZoC5GHRUtV5-xQ+wg@mail.gmail.com>
 (Yegor Yefremov's message of "Fri, 20 Sep 2019 13:36:48 +0200")
References: <20190920113003.21711-1-peter@korsgaard.com>
 <CAGm1_kvyftWG87WG-Vn4whgi2jw=amS0PZoC5GHRUtV5-xQ+wg@mail.gmail.com>
Message-ID: <87k1a3yye3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Hi Peter,
 > On Fri, Sep 20, 2019 at 1:30 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> Joe changed the COPYING file from GPL-1.0 to GPL-2.0 in the development
 >> leading up to 3.8:
 >> 
 >> https://sourceforge.net/p/joe-editor/mercurial/ci/d731f9b3794bc4c896f2efa1c97ac2c82c3365ac/
 >> 
 >> So change the license to GPL-2.0+

 > GPL-2.0+, GPL-2.0 etc. identifiers are deprecated [1].

 > What should we do? Should we switch to the new ones?

 > [1] https://spdx.org/licenses/GPL-2.0+.html

That is a bigger discussion. I personally find the replacement
"(GNU General Public License v2.0 only) or later" harder to read:

https://lists.denx.de/pipermail/u-boot/2015-August/223991.html

Are there any concrete advantages to changing this tree wide?

-- 
Bye, Peter Korsgaard
