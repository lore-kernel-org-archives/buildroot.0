From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 22:47:39 +0200
Subject: [Buildroot] [PATCH v4 03/11] package/llvm: enable AMDGPU
In-Reply-To: <18c4a3ac-db52-5542-e8c6-fc17e3e5251c@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-4-valentin.korenblit@smile.fr>
 <20180330110241.792a6607@windsurf>
 <b5a9d228-d7e1-7330-b5f6-52ad7ea443b9@mind.be>
 <20180330210641.334407b0@windsurf>
 <18c4a3ac-db52-5542-e8c6-fc17e3e5251c@smile.fr>
Message-ID: <20180401224739.2c6f7e04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Mar 2018 22:33:49 +0200, Valentin Korenblit wrote:

> I've just tested your suggestions, but finally we also need to build amdgpu target for host. The reason is that
> llvm-config (host version installed in STAGING) will output only x86 when executing llvm-config --targets-built.
> This is because it stores information related to the build where it comes from.

OK. Then just add a comment in the .mk file that explains this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
