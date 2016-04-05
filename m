From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Apr 2016 16:25:38 +0200
Subject: [Buildroot] [PATCH 1/2] qt5connectivity: add sdpscanner tool
 for Qt5Bluetooth
In-Reply-To: <5702CDE4.1080703@mind.be>
References: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
 <CAGm1_ktt4d7ELbUUuEyPX6qiEvXbBdOGhkiC4+yu_s3K6VP4kw@mail.gmail.com>
 <5702CDE4.1080703@mind.be>
Message-ID: <20160405162538.4bc4eed1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Apr 2016 22:26:12 +0200, Arnout Vandecappelle wrote:

>   That said, I wonder why we are doing all this manual copying for qt5, instead 
> of just running 'make install'. AFAICS the only thing that isn't already cleaned 
> up in the finalize step are the QML files, and these can easily be cleaned up as 
> a finalize hook. Thomas, do you remember why you did it this way?

No, I don't quite remember. It is worth trying to use "make install"
and see if there is any problem. I think the reason for qt5base.mk is
that we want to conditionally install some libraries. But for the other
qt5* packages, I don't remember.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
