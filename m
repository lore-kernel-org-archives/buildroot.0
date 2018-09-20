From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 22:17:04 +0200
Subject: [Buildroot] [PATCH 10/14] package/glibc: URL update
In-Reply-To: <CANQCQpY0V7XxgUWH-PKPzsGUMN3DG1GOAEbvQYUJq+LHH17qNQ@mail.gmail.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-10-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920213028.3f4efbfe@windsurf>
 <CANQCQpY0V7XxgUWH-PKPzsGUMN3DG1GOAEbvQYUJq+LHH17qNQ@mail.gmail.com>
Message-ID: <20180920221704.3dabb7c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 15:05:46 -0500, Matthew Weber wrote:

> > This option is a blind option, so having a help text is not very
> > useful...  
> 
> I had been looking at verifying and updating all packages which could
> end-up with content on target to have a valid URL.  This allows
> auto-generation of CPE XML update requests which need product site
> urls.

Then perhaps this should be explained in the commit log, specifically
for glibc.

But are you sure your approach is the right one ? Today only target
packages have a Config.in file. What are you going to do for host
packages ? You don't care because they are host packages and supposedly
not relevant for security issues on the target ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
