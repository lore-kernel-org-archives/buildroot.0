From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Apr 2016 11:31:12 +0200
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <570B6AC9.2000700@mind.be>
References: <20160408224541.79e1ba4d@itchy> <570A77F9.50506@mind.be>
 <20160411103211.3d9a1581@free-electrons.com>
 <570B6A67.1000806@mind.be> <570B6AC9.2000700@mind.be>
Message-ID: <20160411113112.31fc3d52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Apr 2016 11:13:45 +0200, Arnout Vandecappelle wrote:

>   Unless of course you add a dependency on host-python or host-python3 (make 
> sure you select the version that corresponds to the selected target python, to 
> avoid unnecessarily building both). Since we can probably consider rust to be a 
> big package, adding an addition host-python dependency is acceptable IMHO.

Indeed, adding host-python as a dependency is reasonable for something
big like Rust. Of course, if we can do without Python, fine. But I
really prefer a clean Python script that uses a proper json library,
rather than horrible sed expressions in an obfuscated shell script.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
