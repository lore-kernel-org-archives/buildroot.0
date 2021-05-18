From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 22:44:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/numactl: add -latomic to numa.pc
In-Reply-To: <20210507170701.2301276-1-fontaine.fabrice@gmail.com>
References: <20210507170701.2301276-1-fontaine.fabrice@gmail.com>
Message-ID: <a29b8e58-2da3-6fc2-ba9d-2bc923025ee7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/05/2021 19:07, Fabrice Fontaine wrote:
> Instead of passing -latomic through LDFLAGS as done in commit
> 4ed540ddf59bec4b389be44d7f42820d2466904f, properly check for it in
> configure.ac and add it to numa.pc or numactl users won't be able to get
> it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to next, thanks.

 Regards,
 Arnout
