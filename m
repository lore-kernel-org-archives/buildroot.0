From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 20:48:11 +0100
Subject: [Buildroot] [pull request v4] Pull request for branch
	for-master/doc
In-Reply-To: <cover.1363063387.git.s.martin49@gmail.com>
References: <cover.1363063387.git.s.martin49@gmail.com>
Message-ID: <5140D7FB.3080004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 05:47, Samuel Martin wrote:
>    - Do not embed Kconfiglib python module (because of licensing incertainty,
>    the whole discussion is available online on github);

  With "the whole discussion" I guess you mean issue #6? There, Ulfalizer 
actually says "Do what you want with it except claim that you wrote it". 
So it is safe to include it.

  I've added a comment asking to put this expressly in the source code. 
But with the "do what you want" license, we're allowed to add it 
ourselves :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
