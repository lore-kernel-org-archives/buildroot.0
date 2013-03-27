From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Mar 2013 18:26:09 +0100
Subject: [Buildroot] [PATCH v4 10/21] qt5/qt5svg: new package
In-Reply-To: <87zjxsj4fh.fsf@dell.be.48ers.dk>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <87zjxsj4fh.fsf@dell.be.48ers.dk>
Message-ID: <51532BB1.3080805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/03/13 14:46, Peter Korsgaard wrote:
> How about BR2_PREFER_STATIC_LIB builds, or don't we support that for
> qt5?

  Not at the moment, at least. The configure script does support -static, 
but I guess Thomas never tested it.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
