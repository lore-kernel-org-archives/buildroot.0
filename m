From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 07 Jul 2015 11:34:35 -0300
Subject: [Buildroot] [PATCH 4/4] popt: add hash file
In-Reply-To: <20150707142731.GB12326@tarshish>
References: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
 <1436273552-2877-4-git-send-email-gustavo@zacarias.com.ar>
 <20150707141712.GA12326@tarshish> <559BDFF4.4010003@zacarias.com.ar>
 <20150707142731.GB12326@tarshish>
Message-ID: <559BE37B.7090708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/07/15 11:27, Baruch Siach wrote:

> Is there a reason not to have both md5 (from LFS) and sha256 (locally
> calculated)?

Yes, very subjective though.
Right now we're fetching from a mirror and that's where the md5 comes from.
Proper upstream is back but never provided a md5 or sig for the latest 
releases, so that md5 isn't "original".
I based my calculation on a locally cached popt tarball that predates 
the source change BTW.
And to be honest hashes that aren't backed by announcements (archived on 
mailing lists that are on separate infra, hence harder to tamper with) 
are worth almost nothing.
Regards.
