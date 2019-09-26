From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:28:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd-bootchart: enable
 systemd-bootchart.service
In-Reply-To: <20190917231450.48bee615@windsurf> (Thomas Petazzoni's message of
 "Tue, 17 Sep 2019 23:14:50 +0200")
References: <20190903212812.36514-1-james.hilliard1@gmail.com>
 <20190917231450.48bee615@windsurf>
Message-ID: <87lfub76es.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue,  3 Sep 2019 15:28:12 -0600
 > James Hilliard <james.hilliard1@gmail.com> wrote:

 >> This would normally be enabled by systemctl preset-all however since we
 >> don't have a host systemctl we need to enable the service manually.
 >> 
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> ---
 >> package/systemd-bootchart/systemd-bootchart.mk | 6 ++++++
 >> 1 file changed, 6 insertions(+)

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
