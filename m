From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 08:32:54 +0100
Subject: [Buildroot] [PATCH] ti-cgt-pru: specify need for 32-bit host
 libraries
In-Reply-To: <20200113014141.579479-1-ashcharles@gmail.com> (Ash Charles's
 message of "Sun, 12 Jan 2020 20:41:41 -0500")
References: <20200113014141.579479-1-ashcharles@gmail.com>
Message-ID: <87y2ubbyl5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ash" == Ash Charles <ashcharles@gmail.com> writes:

 > The downloaded source for the ti-cgt-pru package is an installer that
 > requires 32-bit host libraries for extraction. Specify this dependency
 > in the package configuration [1].

 > [1] http://lists.busybox.net/pipermail/buildroot/2020-January/271416.html

 > Signed-off-by: Ash Charles <ashcharles@gmail.com>
 > ---

Committed after adding a reference to the autobuilder issue, thanks.

-- 
Bye, Peter Korsgaard
