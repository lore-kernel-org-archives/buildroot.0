From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 5 Feb 2020 23:14:21 +0100
Subject: [Buildroot] [PATCH v15 0/5] package/gobject-introspection: new
 package
In-Reply-To: <80581602-4f4a-faa1-de3a-c9377be09dfa@benettiengineering.com>
References: <20200204213956.2124306-1-aduskett@gmail.com>
 <80581602-4f4a-faa1-de3a-c9377be09dfa@benettiengineering.com>
Message-ID: <d70d7224-41a4-238d-179c-2afc2046e98d@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/5/20 5:07 PM, Giulio Benetti wrote:
> Hi Adam,
> 
> unfortunately trying to issue a ./utils/test-pkg -p
> gobject-introspection -d ../test-gio -a results in SKIPPED for every arch.

You've forgotten package's entry in package/Config.in

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Can you give a try and tell me if it is the same for you?
> 
> Thanks
> 
> Best regards
> 
