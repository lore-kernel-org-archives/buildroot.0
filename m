From: Bogdan Cristea <cristeab@gmail.com>
Date: Mon, 16 Nov 2009 11:34:15 +0200
Subject: [Buildroot] Creating a filesystem for Real Time Linux using QEMU
In-Reply-To: <4B011295.8080801@gmail.com>
References: <200911160805.13709.cristeab@gmail.com>
	<4B011295.8080801@gmail.com>
Message-ID: <200911161134.15726.cristeab@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 16 November 2009 10:51:33 you wrote:
> Add "rw" to your append command.
> 
> So change it to -append "root=/dev/sda rw"
> 

Thanks for the tip, it allows me to write to the virtual hard disk, but still 
the changes are not permanent.
