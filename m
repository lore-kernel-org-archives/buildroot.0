From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Tue, 10 Apr 2007 09:00:18 +0200
Subject: [Buildroot] frame buffer problems
In-Reply-To: <2666.63.193.249.101.1175952704.squirrel@webmail.aerende.com>
	(nina holly's message of "Sat, 7 Apr 2007 06:31:44 -0700 (PDT)")
References: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
	<43e72e890704061005g7acb436es181f5d9e2c788427@mail.gmail.com>
	<2666.63.193.249.101.1175952704.squirrel@webmail.aerende.com>
Message-ID: <87tzvoogsd.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nh" == nina holly <nina.holly@aerende.com> writes:

Hi,

nh> The frame buffer test program I am using does the following: A.
nh> Open /dev/fb/0 with fb_ptr = open("/dev/fb/0", O_RDWR);

Do you have a /dev/fb/0? What is it's major/minor numbers?
What is the return value of open?

nh> ioctl(frame_buffer_ptr, FBIOGET_FSCREENINFO, &fix_info); C.
nh> ioctl(frame_buffer_ptr, FBIOGET_VSCREENINFO, &var_info);

And of the ioctls?

-- 
Bye, Peter Korsgaard
