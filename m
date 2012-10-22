From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 12:11:22 +0200
Subject: [Buildroot] filename format for kernel patches when using
 kernelfrom git ?
In-Reply-To: <78B6349933E14FAB8DBC181EC080FA04@JohanW7>
References: <C22CB8643B1E42C898B890C9A3A7539F@JohanW7>
 <78B6349933E14FAB8DBC181EC080FA04@JohanW7>
Message-ID: <20121022121122.452fe63f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 18 Oct 2012 18:23:48 +0200, Sagaert Johan wrote:

> I discovered the use of a file called 'series' to list the patches
> and apply the patches in the order I want.

Either this, or simply name your patches:

	linux-<something>.patch

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
