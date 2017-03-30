From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:32:14 +0200
Subject: [Buildroot] [PATCH 1/1] apr: fix size of pid_t
In-Reply-To: <20170321230453.6165e76d@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 21 Mar 2017 23:04:53 +0100")
References: <20170321132356.16093-1-julien.beraud@spectracom.orolia.com>
 <20170321230453.6165e76d@free-electrons.com>
Message-ID: <877f361jm9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 21 Mar 2017 14:23:56 +0100, Julien Beraud wrote:
 >> pid_t is a signed 32bits integer on both 32bits and 64bits
 >> architectures.
 >> This fixes an issue with apache server which causes bad pid
 >> to be written in PidFile
 >> 
 >> Signed-off-by: Julien Beraud <julien.beraud@spectracom.orolia.com>
 >> ---
 >> package/apr/apr.mk | 1 +
 >> 1 file changed, 1 insertion(+)

 > I've applied to our master branch, thanks! Peter, I believe this is a
 > good candidate for the LTS branch.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
