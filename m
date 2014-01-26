From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Sun, 26 Jan 2014 19:12:50 +0200
Subject: [Buildroot] i686-buildroot-linux-gnu-as  does not work
In-Reply-To: <1390645407.666601332@f346.i.mail.ru>
References: <1390645407.666601332@f346.i.mail.ru>
Message-ID: <52E54212.8090100@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kirill,

01/25/2014 12:23 PM, ?????? ??????? wrote:
> I have got very strange error during building of BuildRoot project.
> It happens after running following commands in
> /.../BuildRoot/output/build/infozip-30 directory:

  Could you please send your Buildroot config file attached or pasted
into the message text as defconfig? You can produce defconfig by

make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>

  What Buildroot release / commit id do you use?

-- 
Best regards,
  Alexander Lukichev
