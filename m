From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Sun, 01 Oct 2006 13:16:27 -0600
Subject: [Buildroot] Setting up a new kernel with modules ?
In-Reply-To: <1159686025.3472.7.camel@glynys>
References: <1159686025.3472.7.camel@glynys>
Message-ID: <1159730187.4450.0.camel@iridium.gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2006-10-01 at 07:00 +0000, mike wrote:

> I've done a...
> 
> make INSTALL_PATH=/home/mike/buildroot/build_i386/root install

make modules_install I think is what you are looking for.

-- 
Nathanael D. Noblet <nathanael@gnat.ca>
Gnat Solutions, Inc
