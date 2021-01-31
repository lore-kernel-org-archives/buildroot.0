From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:13:46 +0100
Subject: [Buildroot] [RFC PATCH 0/1] package/sysklogd: proposal to
 update default syslog.conf
In-Reply-To: <20210130135203.159451-1-troglobit@gmail.com>
References: <20210130135203.159451-1-troglobit@gmail.com>
Message-ID: <20210131231346.6bce24e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 14:52:02 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> I'm posting this as an RFC patch to see what you think about updating
> the default syslog.conf for the sysklogd package to match upstream.
> 
> The updated file changes the default log file from messages to syslog,
> as is common on most modern systems today.  The messages remains but
> only for less critical messages.  The update also adds more examples
> for how to enable remote logging as well as different new log formats.

Well, if the syslog.conf that we have in package/sysklogd/ is exactly
the one contained in the sysklogd sources, then what is the point of
having a copy in package/sysklogd/ ? We could just as well install the
configuration file provided by upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
