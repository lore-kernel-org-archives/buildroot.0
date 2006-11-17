From: Pavel Roskin <proski@gnu.org>
Date: Fri, 17 Nov 2006 12:43:33 -0500
Subject: [Buildroot] [PATCH] Update hdparm version
In-Reply-To: <20061117160621.GD28121@aon.at>
References: <1163030877.27162.19.camel@dv>  <20061117160621.GD28121@aon.at>
Message-ID: <1163785413.30237.5.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2006-11-17 at 17:06 +0100, Bernhard Fischer wrote:
> On Wed, Nov 08, 2006 at 07:07:57PM -0500, Pavel Roskin wrote:
> >Hello!
> >
> >hdparm-6.5.tar.gz is no longer present on ibiblio.org.  Current version
> >of hdparm is 6.7.  Update hdparm version to 6.7.
> 
> Thanks, applied.
> 
> Why don't you use the hdparm that is in busybox?

The only reason is because the standalone hdparm is enabled by default.
All I needed was a cross-compiler from x86_64 to armbe, so I didn't
spend much time fine tuning the configuration of the userspace programs.

Maybe you could review the defaults if you think hdparm in busybox is
adequate.

-- 
Regards,
Pavel Roskin
