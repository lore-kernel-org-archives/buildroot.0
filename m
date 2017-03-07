From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 16:09:57 +0100
Subject: [Buildroot] [PATCH] harfbuzz: security bump to version 1.4.4
In-Reply-To: <20170306174637.530a4023@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 6 Mar 2017 17:46:37 +0100")
References: <20170306145449.4627-1-gustavo@zacarias.com.ar>
 <20170306174637.530a4023@free-electrons.com>
Message-ID: <874lz5dsxm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon,  6 Mar 2017 11:54:49 -0300, Gustavo Zacarias wrote:
 >> Fixes a buffer-overrun in Bengali.
 >> Switch to https URL to avoid a small delay in protocol redirection.
 >> 
 >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 >> ---
 >> package/harfbuzz/harfbuzz.hash | 4 ++--
 >> package/harfbuzz/harfbuzz.mk   | 4 ++--
 >> 2 files changed, 4 insertions(+), 4 deletions(-)

 > Applied to master, thanks. Peter: we want this one for LTS I guess.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
