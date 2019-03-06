From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Mar 2019 10:20:39 -0600
Subject: [Buildroot] Gsoc Interest : Follow upstream updates and CVEs of
 packages
In-Reply-To: <CALKvhuOFNyav9hJ73YgEFMx8mig3j36GHAdXOnJvFykcaCUVGQ@mail.gmail.com>
References: <CALKvhuOFNyav9hJ73YgEFMx8mig3j36GHAdXOnJvFykcaCUVGQ@mail.gmail.com>
Message-ID: <CANQCQpa-bccz8tigO4K=oJ1jzBcOANOicS1n5XxpFKq0vAVdYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Manas,

On Wed, Mar 6, 2019 at 2:55 AM Manas Mangaonkar
<manasmangaonkar@gmail.com> wrote:
>
> Hi,
>
> My Name is Manas  [IRC: Pac23/Pac23xyz] i am a CE undergrad at the University of Mumbai,Came across the Following Upstream project and would love to work on it as part of Gsoc.
>
> I discussed this on the IRC and was told to ping here,afaik there already exists some code for this,can someone kindly link to the codebase/repo. I have seen some of it in the mailing list archive.
>

I have been working a series to add CPE reporting to Buildroot so that
a manifest could be produced with each build.  In the series [1], the
[2] patch added the checking of CPE status in the pkg-stats script
(this is the script with the new release monitoring hooks).  We did
not look at the problem space of checking for valid CVE against each
the CPE.  I do wonder if adding the CPE id and CVE tracking directly
to release monitoring site would have more value then to our pkg-stats
or a new script.  Then a report could be ran at the release-monitoring
site level to list open CVE on the Buildroot project.

I do owe a refresh of [1] as it has been awhile since I rebased and
sent a new version.

Matt

[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=71318&state=*
[2] http://patchwork.ozlabs.org/patch/985550/
