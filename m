From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 11:33:58 +0200
Subject: [Buildroot] [PATCH] package/cups-filters: disable Braille
 embosing filters
In-Reply-To: <20190929014900.6470-1-unixmania@gmail.com> (unixmania's message
 of "Sat, 28 Sep 2019 22:49:00 -0300")
References: <20190929014900.6470-1-unixmania@gmail.com>
Message-ID: <87d0fgzu61.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Otherwise they are installed even though the Braille support is not
 > built because it requires liblouis, which is not available.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
