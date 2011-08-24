From: Alexjan Carraturo <axjslack@gmail.com>
Date: Wed, 24 Aug 2011 10:48:53 +0200
Subject: [Buildroot] Login of Buildroot
In-Reply-To: <CALR4fELAirpxcgiWC_F3jOC-n8M-nA+7LS-vAzC+HyhY3T2BKw@mail.gmail.com>
References: <CACR8Qs8iO8CmjaW4bf-XYJ3TLvW4oLJVewO4i2Mc5E7e8n0X-g@mail.gmail.com>
 <CALR4fELAirpxcgiWC_F3jOC-n8M-nA+7LS-vAzC+HyhY3T2BKw@mail.gmail.com>
Message-ID: <CACR8Qs87dcKMFDsgrea881x7tod3inSJSiSct9SniTaKSF8BSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/8/24 Diego Iastrubni <diegoiast@gmail.com>:
> On Wed, Aug 24, 2011 at 11:12 AM, Alexjan Carraturo <axjslack@gmail.com> wrote:
>> I tried to see the "shadow" file, and the file password it's clear, I
>> check even the "securetty", and my tty is present in that file. I
>> tried to start in signle mode and change manually the password, and,
>> even if that write in the "shadow" file, when I reboot, it's
>> impossibile to make login.
>
> What happens if you remove "securetty"? Do you have the correct /dev/*
> files? (for example /dev/tty)
>

What do you mean with "remove securetty"; do you mean remove my tty
from file, or remove the file "securetty"?

The correct tty is present (/dev/ttyAMA0) and seems to have right
permissions (crw-rw-rw).

-- 
Alexjan Carraturo
--
Free Software User Group Italia administrator (http://www.fsugitalia.org)
Fedora/OpenSUSE Ambassador
member of FSFE Italian Team

Twitter/Facebook/Identica: axjslack
Blog: http://axjslack.wordpress.com
--
