From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Apr 2013 20:16:51 +0200
Subject: [Buildroot] Including wine package - Reg
In-Reply-To: <CAGK4xy4fnpOkmYJJ_+YoXJHG2Rf6BrxMyXTjjYHtDDp_R8zM8g@mail.gmail.com>
References: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
 <20130408231204.0b30b7df@skate>
 <CAGK4xy5fzi5F0C_CaAq0e2JJmdUhNKD3ZuBqE8cBw8dsV+HQrw@mail.gmail.com>
 <20130408233156.0ab27a38@skate>
 <CAGK4xy49Dm1G0J3w2CUzHZ2=2bObyd8i94e1mdYnzy8vTJg-KQ@mail.gmail.com>
 <CAGK4xy4fnpOkmYJJ_+YoXJHG2Rf6BrxMyXTjjYHtDDp_R8zM8g@mail.gmail.com>
Message-ID: <20130409201651.35dc862f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arunkumar Vijayakumar,

On Tue, 9 Apr 2013 04:10:04 +0530, Arunkumar Vijayakumar wrote:

> I tried with the autotools options as per your suggestion and got the
> error, please find the attached config.log for your kind reference.
> 
> Kindly advice me where Im making mistakes ?

It doesn't find the cross-compiler, so something looks really wrong in
your Buildroot build.

Can you do:

	make clean
	make 2>&1 | tee build.log

Put the contents of build.log on some pastebin site, and give us the
URL?

Please also pastebin your Buildroot .config file.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
