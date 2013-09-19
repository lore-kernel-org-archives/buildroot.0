From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 17:49:09 +0200
Subject: [Buildroot] [PATCH 4 of 4] manual generation: rename manual-txt
 into manual-text
In-Reply-To: <20130919174042.541b6c51@skate>
References: <patchbomb.1379587632@argentina>
 <a2b05987569c1439422b.1379587636@argentina>
 <20130919174042.541b6c51@skate>
Message-ID: <CAAXf6LUFF+KTNicPmjy1Qp1=01-Qtm9Ytz8bndV=3a27qX7J7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 19, 2013 at 5:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 19 Sep 2013 12:47:16 +0200, Thomas De Schampheleire wrote:
>> The output extension and the generation messages refer to 'text', but the make
>> target was confusingly 'txt'. This patch changes the make target for
>> consistency.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> That's a change in the Buildroot interface, but I believe it's ok.

True. I figured that the manual is built only rarely (many people are
using the release tarballs), let alone that manual-txt is explicitly
called. People that do build manual-txt are often buildroot
developers, and hopefully they are flexible enough :-)

> However, you're not updating another occurrence of manual-txt in the
> main Makefile (see the release target).

Ai, sorry, I didn't think of that. Will fix.

Thanks for your feedback,
Thomas
