From: Hebbar <gururajakr@sanyo.co.in>
Date: Sun, 5 Aug 2007 22:56:10 -0700 (PDT)
Subject: [Buildroot] how to build expat/libxml2 before fontconfig
Message-ID: <12011389.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

 Fontconfig depends on expat/libxml2. But in the buildroot compile steps,
fontconfig builds 1st & fails with missing xml variable errors. I have tried
selecting both expat/libxml2 but still it fails. 

 So what i have to do is 1st enter make & wait till fontonfig fails with
error. then give "make expat / make libxml2". then "make fontconfig-clean" &
then make. 

  But this is surely a unprofessional step/solution. So what is the quickest
way to solve this.

Thanks in advance.

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/how-to-build-expat-libxml2-before-fontconfig-tf4222376.html#a12011389
Sent from the BuildRoot mailing list archive at Nabble.com.
