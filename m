From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Nov 2019 10:29:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.15.5
In-Reply-To: <20191102223151.115b219b@windsurf.home>
References: <20191101214052.19167-1-bernd.kuhls@t-online.de>
 <20191102102425.GA2710@scaer>
 <20191102223151.115b219b@windsurf.home>
Message-ID: <20191103092911.GE2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-11-02 22:31 +0100, Thomas Petazzoni spake thusly:
> On Sat, 2 Nov 2019 11:24:25 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > On 2019-11-01 22:40 +0100, Bernd Kuhls spake thusly:
> > > Release notes:
> > > https://blog.kitware.com/cmake-3-15-5-available-for-download/  
> > 
> > Thanks for the poitner to the release notes.
> > 
> > Although I understand we usually want to update, the release notes for
> > this version only list one fix to an example file, and fixes for VS
> > (Visual Studio, thus Windows) and Xcode (thus MacOS). So, nothing that
> > applies to Linux, and to us.
> > 
> > I don't think we want updates just for the sake of having updates.
> > Bumping a package, especially one that can be considered part of the
> > core components, should bring something besides just bragging about
> > "up-to-date".
> 
> I beg to disagree here. Of course, in stable releases or after -rc1 has
> been released, we don't want to see "gratuitous" version bumps.
> 
> However, outside of these moments, those gratuitous updates are fine.
> Indeed, they reduce the effort that will be needed for the next "real"
> bump. Indeed, we can very easily check what are the changes between
> 3.15.4 and 3.15.5, but what if we don't update to 3.15.7, 3.15.8,
> 3.15.9 because none of these contain any change that look "useful" ?
> Then when 3.15.10 appears, we have to bump from 3.15.4 to 3.15.10 in
> one go, and review at this point what all the changes were. I very much
> prefer doing incremental bumps.

Right; agreed now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
