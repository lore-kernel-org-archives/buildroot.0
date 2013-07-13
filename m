From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sat, 13 Jul 2013 11:24:04 -0500
Subject: [Buildroot] [PATCH v5 3/3] qt: add powervr and opengl
In-Reply-To: <20130713161320.4a7174b3@skate>
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
 <1373639678-7357-3-git-send-email-spenser@gillilanding.com>
 <20130713161320.4a7174b3@skate>
Message-ID: <CAEBucnANcfix57Ga40EAkDD+dJyHdy8G-aF63HsxWHJBSqhfXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

>> ---
>>  package/qt/Config.gfx.in                |   5 +
>>  package/qt/Config.in                    |   8 +
>>  package/qt/powervr.ini                  |   2 +
>>  package/qt/qt-eglwsegl-use-system.patch | 802 ++++++++++++++++++++++++++++++++
>
> In the patch set I had sent to you privately about Qt4/PowerVR, there
> was an additional patch, which was really necessary. Why did you remove
> it?

It's not removed; both patches are combined.  They both solve the
issue of fixing include paths. So, I didn't think it was necessary to
keep them split.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
