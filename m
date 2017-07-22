From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 21:44:25 +0200
Subject: [Buildroot] [RFC v1] libv4l: build utils only on MMU (with fork
 support) platforms
In-Reply-To: <41bd7a05-4254-e7e4-7846-ed5e4d99d0ad@st.com>
References: <20170711172624.7516-1-ps.report@gmx.net>
 <70ff5d21-0466-c470-cac3-e00c524c93b0@st.com>
 <20170717200901.51814cb5@gmx.net>
 <41bd7a05-4254-e7e4-7846-ed5e4d99d0ad@st.com>
Message-ID: <20170722214425.5c9ab5a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 09:08:18 +0000, Hugues FRUCHET wrote:

> Back to your exact build issue, the best fix on my opinion is to add a 
> dependency on fork() symbol in configure.ac instead of the one proposed 
> in libv4l.mk, find attached a patch proposal.

Does your patch actually work? A lot of the utils in utils/ do require
the libraries, won't they fail to build if the libraries are not built ?

Could you make a clean patch submission to resolve this issue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
