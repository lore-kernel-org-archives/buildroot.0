From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Feb 2015 17:21:53 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5multimedia: fix compile without
 opengl
In-Reply-To: <trinity-9793f5a9-f1ef-4912-92e4-dc7acbb69ddc-1422481699290@3capp-gmx-bs31>
References: <trinity-9793f5a9-f1ef-4912-92e4-dc7acbb69ddc-1422481699290@3capp-gmx-bs31>
Message-ID: <54D0F5A1.8040004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/15 22:48, Peter Seiderer wrote:
> But I searched upstream git, there is already a fix in 5.4.1/dev branch
> fixing this problem ([1]), but as I think doing it the wrong way,
> disabling Format_RGB24 for the non-OpenGL case ([2]), but a follow up
> patch fixing the issue is on its way upstream ([3])...

 Could you then submit those two upstream patches? Either separately or
squashed, but with a reference to the upstream commit and your SoB.

 Regards,
 Arnout

> 
> Regards,
> Peter
> 
> [1] https://qt.gitorious.org/qt/qtmultimedia/commit/2b181d546970d18a48a0f36f5d1a22418b61cd4d
> [2] https://codereview.qt-project.org/101817
> [3] https://codereview.qt-project.org/104811
> 
>>
>> Thanks,
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
