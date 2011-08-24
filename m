From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 24 Aug 2011 11:39:45 +0300
Subject: [Buildroot] Login of Buildroot
In-Reply-To: <CACR8Qs8iO8CmjaW4bf-XYJ3TLvW4oLJVewO4i2Mc5E7e8n0X-g@mail.gmail.com>
References: <CACR8Qs8iO8CmjaW4bf-XYJ3TLvW4oLJVewO4i2Mc5E7e8n0X-g@mail.gmail.com>
Message-ID: <CALR4fELAirpxcgiWC_F3jOC-n8M-nA+7LS-vAzC+HyhY3T2BKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 24, 2011 at 11:12 AM, Alexjan Carraturo <axjslack@gmail.com> wrote:
> I tried to see the "shadow" file, and the file password it's clear, I
> check even the "securetty", and my tty is present in that file. I
> tried to start in signle mode and change manually the password, and,
> even if that write in the "shadow" file, when I reboot, it's
> impossibile to make login.

What happens if you remove "securetty"? Do you have the correct /dev/*
files? (for example /dev/tty)
