From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 00:22:21 +0100
Subject: [Buildroot] [PATCH] libiio: Disable MATLAB Bindings on Target
In-Reply-To: <20170314234119.73e00147@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 14 Mar 2017 23:41:19 +0100")
References: <1489433702-3044-1-git-send-email-mfornero@mathworks.com>
 <20170314234119.73e00147@free-electrons.com>
Message-ID: <87shmftpea.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 13 Mar 2017 15:35:02 -0400, Matthew Fornero wrote:
 >> If building on a machine with MATLAB installed, the MATLAB bindings will
 >> default to ON, which is not the desired behavior for a cross build.
 >> 
 >> The bindings are designed to be called from within MATLAB, and we are
 >> not currently running MATLAB on buildroot-generated targets.
 >> 
 >> This does not preclude the use of the bindings from a host connecting
 >> over the network backend (assuming libiio on the host has the bindings
 >> enabled).
 >> 
 >> Signed-off-by: Matthew Fornero <mfornero@mathworks.com>
 >> ---
 >> package/libiio/libiio.mk | 1 +
 >> 1 file changed, 1 insertion(+)

 > Applied to master, after slightly tweaking the commit title. Thanks!

 > Peter: perhaps we want this for the LTS branch? Not sure.

It seems pretty safe to add it. Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
