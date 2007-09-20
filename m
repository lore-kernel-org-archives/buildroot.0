From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 11:38:58 +0200
Subject: [Buildroot] libusb now compile - patch 02
In-Reply-To: <46F1DD57.5090403@gmail.com>
References: <a63ecaf0709190929h6296331epf5388fc46e0922a1@mail.gmail.com>
	<12788591.post@talk.nabble.com>
	<37c712e0709191721r6eb18b51l5c4e9cf53e523ba@mail.gmail.com>
	<12789032.post@talk.nabble.com> <46F1DD57.5090403@gmail.com>
Message-ID: <20070920093858.GD27699@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 11:39:19PM -0300, Rex Luscus wrote:
> Thanks to Hebbar and Allan. This is the final patch
> Hebbar escribi?:
>> libusb library.
>> 4. So i manually added below code after (Sushi  + Allan) Patch 
>>        cp -dpf $(LIBUSB_DIR)/.libs/libusb*.so* $(STAGING_DIR)/usr/lib

Can you try if r19905 works for you? I don't remember offhand if this
works as expected:

cd /tmp
mdkir one
rm -rf two
echo bar | tee one/file1 > one/file2
install -D one/file* /tmp/two
