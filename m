From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 19 Oct 2006 11:00:33 +0200
Subject: [Buildroot] ltrace
In-Reply-To: <20061019080804.GB29730@zelow.no>
References: <20061019080804.GB29730@zelow.no>
Message-ID: <20061019090033.GA572@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 19, 2006 at 10:08:04AM +0200, Thomas Lundquist wrote:
> I've tried to add -I (to TARGET/usr/incluve, where it is) but  to no
> avail. I've installed the libelf-dev package on my host and I've tried
> ltrace 4.0.

anyway, with the patch mentioned in
<URL:http://bugs.busybox.net/view.php?id=626> strace works on my arm
target.


Thomas.
