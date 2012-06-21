From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jun 2012 22:32:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-20
In-Reply-To: <87ipelqccc.fsf@macbook.be.48ers.dk>
References: <20120621063115.B05E852CEBE@lolut.humanoidz.org>
 <87ipelqccc.fsf@macbook.be.48ers.dk>
Message-ID: <4FE384D5.2050204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/21/12 10:49, Peter Korsgaard wrote:
>   Thomas>  Status         : NOK
>   Thomas>  Failure reason : ffmpeg-0.8.11
>   Thomas>  Architecture   : arm
>   Thomas>  Submitted by   : Thomas Petazzoni (Free Electrons build server)
>   Thomas>  Submitted at   : 2012-06-20 20:57:51
>   Thomas>  Git commit ID  :http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
>   Thomas>  End of log     :http://autobuild.buildroot.net/results/3270ce7b816f7d141327a09e9c4273fd001827fb/build-end.log
>
> ARM/thumb mismatch?

  Wild guess: toolchain is compiled to support fpa only, not vfp.
I don't know how you can create such a toolchain though...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
