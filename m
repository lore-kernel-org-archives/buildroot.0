From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 3 Mar 2021 12:22:35 +0000
Subject: [Buildroot] [PATCH] package/dmalloc: Fix for ARC with enabled
 BR2_SSP_ALL
In-Reply-To: <SN1PR12MB2351CE14450D2AF4FA2C36B5CA9D9@SN1PR12MB2351.namprd12.prod.outlook.com>
References: <20210209104726.20132-1-kremneva@synopsys.com>
 <20210210214514.GF1679218@scaer>,
 <CAPi7W82a7VoXvCjiy_A=i69XzBV+SV1-Ca5PigWgtKneWb6-Dg@mail.gmail.com>,
 <BN8PR12MB333092855272691D7C9F776FA18A9@BN8PR12MB3330.namprd12.prod.outlook.com>,
 <SN1PR12MB2351CE14450D2AF4FA2C36B5CA9D9@SN1PR12MB2351.namprd12.prod.outlook.com>
Message-ID: <BN8PR12MB333045D2F68C2FAFCDEBBC34A1989@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

I guess we may settle on building Dmalloc with "-fPIC" unconditionally.
Is there anything else we may do here? Re-spin of anything etc?

-Alexey
