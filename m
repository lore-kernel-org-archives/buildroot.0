From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Mar 2012 22:26:08 +0200
Subject: [Buildroot] [PATCH 1/1] lttng-libust: rename patch so that it
	is taken into account
In-Reply-To: <b3435944bbaf51566d808dc51aea2e2715143dbd.1332801197.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332801197.git.thomas.petazzoni@free-electrons.com>
 <b3435944bbaf51566d808dc51aea2e2715143dbd.1332801197.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201203282226.09646.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 27 March 2012 00:33:21 Thomas Petazzoni wrote:
> The package/lttng-libust/ contains a patch prefixed with
> lttng-libust-1.9.2, so the other patch simply prefixed with
> lttng-libust does not get applied. Rename the second patch properly.

 I thought we agreed to avoid versioned patches as much as possible, no?
So this should rather be a rename of 
lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
