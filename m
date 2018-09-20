From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 15:31:14 -0500
Subject: [Buildroot] [PATCH 10/14] package/glibc: URL update
In-Reply-To: <20180920221704.3dabb7c3@windsurf>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-10-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920213028.3f4efbfe@windsurf>
 <CANQCQpY0V7XxgUWH-PKPzsGUMN3DG1GOAEbvQYUJq+LHH17qNQ@mail.gmail.com>
 <20180920221704.3dabb7c3@windsurf>
Message-ID: <CANQCQpbGm1TXXdGuPRv5c-4xgX7KRKJr2xK13Rfz0kvTb+S7fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Sep 20, 2018 at 3:17 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 20 Sep 2018 15:05:46 -0500, Matthew Weber wrote:
>
> > > This option is a blind option, so having a help text is not very
> > > useful...
> >
> > I had been looking at verifying and updating all packages which could
> > end-up with content on target to have a valid URL.  This allows
> > auto-generation of CPE XML update requests which need product site
> > urls.
>
> Then perhaps this should be explained in the commit log, specifically
> for glibc.
>
Yes, agree.

> But are you sure your approach is the right one ? Today only target
> packages have a Config.in file. What are you going to do for host
> packages ?
Currently the xml generation was a best effort and the cpe reporting
was only done against target CPE so far.....  Glad to discuss
suggestions for a better way vs hand updating the xml with this URL
info.

> You don't care because they are host packages and supposedly
> not relevant for security issues on the target ?

I know better then to say that host packages don't matter :-)  We took
the most accessible path first and that was to get good coverage on
target packages.

Maybe a good topic for next month?  I should have an updated CPE
patchset out in the next week.

Matt
