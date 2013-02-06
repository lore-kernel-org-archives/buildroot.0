From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 11:43:57 +0100
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <51122C85.2030907@eolane.com>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiceG=GK44-_ajFvzvHLh4XrQ0XV+AzPG9CdLiXt0+pkg@mail.gmail.com>
 <20130206110401.66b6d875@skate> <51122C85.2030907@eolane.com>
Message-ID: <20130206114357.066f4be4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fr?d?ric COIFFIER,

On Wed, 06 Feb 2013 11:12:21 +0100, Fr?d?ric COIFFIER wrote:

> Did you get a patch for solving your segfault with the LinuxFb backend ?
> I made a similar test few weeks ago and got the same problem on an i.MX6
> board.
> I saw your mail in the Qt-project mailing list but no answer from the Qt
> team

Yes, there were two problems:

 * An ioctl() related problem, which I fixed (patch had been sent on
   the qt-interest mailing list)

 * A crash after that. But I was told a few days ago that the crash
   only appeared with the specific example application I was trying,
   and that all the other applications worked fine. Since I got this
   information, I haven't been able to test it by myself. I'll do so as
   soon as I start working on Qt5 again, hopefully this week.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
